class MessagesController < ApplicationController
  before_action :set_dream
  def create
    @message = Message.new(message_params)
    @message.dream = @dream
    @message.role = "user"

    if @message.save!
      # chat = RubyLLM.chat
      # response = chat.with_instruction(Dream.system_prompt)
      # Message.create {
      #   content: response.content,
      #   role: "assistant"
      # )
      redirect_to chat_dream_path(@dream)
    else
      render "chat", status: :unprocessable_entity
    end
  end

  # /dreams/:id/chat
  def chat
    @message = Message.new
    @messages = @dream.messages
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
