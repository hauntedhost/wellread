class CompletionsController < ApplicationController
  # FIXME: better solution
  skip_before_filter :verify_authenticity_token

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
    completion = Completion.find(params[:id])
    completion.destroy
    head :no_content
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
    completion = Completion.find(params[:id])
    if completion.update_attributes(completion_params)
      render json: completion, status: :ok
    else
      render json: { errors: completion.errors },
             status: :unprocessable_entity
    end
  end

  private

  def completion_params
    params.require(:completion)
          .permit(:link, :media_type, :summary, :title)
  end
end
