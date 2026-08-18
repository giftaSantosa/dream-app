class MessagesController < ApplicationController
  before_action :set_dream

  PROMPT = "You are an experienced dream analyzer who combines mystical and scientific interpretation. You will receive an interpreted dream and answer follow-up questions about it. Keep responses concise (max 3 sentences) and end with a brief practical recommendation."

  INPTERPRETED_DREAM = "You are stressed, you need to take longer hours in your dream"

  def create
    @message = Message.new(message_params)
    @message.dream = @dream
    @message.role = "user"

    if @message.save
      chat = RubyLLM.chat
      chat.with_instructions("#{PROMPT}. This is the interpreted dream #{INPTERPRETED_DREAM}")
      response = chat.ask(@message.content)
      ai_message = Message.new(
        content: response.content,
        role: "assistant",
        dream: @dream
      )
      ai_message.save
      redirect_to chat_dream_path(@dream)
    else
      render "chat", status: :unprocessable_entity
    end
  end

  # /dreams/:id/chat
  def chat
    @message = Message.new
    @messages = @dream.messages.order(:created_at)
    @user_messages = @dream.messages.where(role: "user")
    @asssistant_messages = @dream.messages.where(role: "assistant")
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_dream
    id = params[:dream_id] || params[:id]
    @dream = Dream.find(id)
  end
end
