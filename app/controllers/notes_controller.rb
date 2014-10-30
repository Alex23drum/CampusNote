class NotesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  def index
    @notes = current_user.notes
  end

  # GET /notes/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf:       @note.title,
               template:  'notes/show.pdf.erb',
               layout:    'pdf.html.erb',
               encoding:  'UTF-8'
      end
    end
  end

  # GET /notes/new
  def new
    @note = current_user.notes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note, notice: 'ノートを作成しました'
    else
      render :new
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'ノートを更新しました'
    else
      render :edit
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
      redirect_to notes_url, notice: 'ノートを削除しました'
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end
end
