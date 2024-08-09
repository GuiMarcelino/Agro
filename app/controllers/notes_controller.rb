# app/controllers/notes_controller.rb
class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    notes = Note.all
    render json: notes
  end

  def show
    render json: @note
  end

  def create
    note = Note.new(note_params)
    if note.save
      render json: note, status: :created
    else
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    head :no_content
  end

  private

  def set_note
    @note = Note.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Note not found' }, status: :not_found
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
