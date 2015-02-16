class CompletionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    completion = Completion.new(completion_params)
    if completion.save
      render json: completion, status: :created
    else
      render json: { errors: completion.errors },
             status: :unprocessable_entity
    end
  end

  def destroy
  end

  def index
    completions = Completion.all
    render json: completions
  end

  def show
    completion = Completion.find(params[:id])
    render json: completion
  end

  def update
  end

  private

  def completion_params
    params.require(:completion)
          .permit(:link, :media_type, :summary, :title)
  end
end
