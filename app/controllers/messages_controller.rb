class MessagesController < ApplicationController
  before_action :set_dream

  PROMPT = "You are an experienced dream analyzer who combines mystical and scientific interpretation. You will receive an interpreted dream and answer follow-up questions about it. Keep responses concise (max 3 sentences) and end with a brief practical recommendation (if given a dream)."

  INPTERPRETED_DREAM = "You are stressed, you need to take longer hours in your dream"

  def create
    @message = Message.new(message_params)
    @message.dream = @dream
    @message.role = "user"

    if @message.save
      get_llm_response
    else
      @messages = @dream.messages.order(:created_at)
      render "chat", status: :unprocessable_entity
    end
  end

  def chat
    @message = Message.new
    Message.create(
      content: "The meaning of your dream was #{@dream.interpretation['summary']}\nHow can I help you?",
      role: "assistant",
      dream: @dream
    )
    @messages = @dream.messages.order(:created_at)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_dream
    id = params[:dream_id] || params[:id]
    @dream = Dream.find(id)
  end

  def get_llm_response
    chat = RubyLLM.chat.with_temperature(0.8)

    @dream.messages.each do |message|
      chat.add_message(role: message.role, content: message.content)
    end
    chat.with_instructions("#{PROMPT}. This is the interpreted dream #{@dream.interpretation['summary']}")
    response = chat.ask(@message.content)

    @ai_message = Message.new(
      content: response.content,
      role: "assistant",
      dream: @dream
    )

    @ai_message.save
  end
end
