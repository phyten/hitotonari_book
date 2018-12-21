class WholeAnswersController < ApplicationController
  
    
  def index
    @whole_answer = WholeAnswer.all
  end

  def show
    @whole_answer = WholeAnswer.find(params[:id])
  end

  def new
    @book = Book.find(id: params[:book_id])
    @whole_answer = @book.whole_answers.build
    @whole_answer.periods.build
    WholeQuestion.detailed_question_length.times.each do |c|
      @whole_answer.detailed_answers.build
    end
  end

  def create
    @whole_answer = current_user.whole_answers.build(whole_answer_params)
    if @whole_answer.save
      flash[:success] = '回答を保存しました。'
      redirect_to root_url
    else
      @whole_answer = current_user.whole_answers.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '回答保存に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @whole_answer = WholeAnswer.find(params[:id])
  end

  def update
    @whole_answer = WholeAnswer.find(params[:id])

    if @whole_answer.update(whole_answer_params)
      flash[:success] = '回答 は正常に更新されました'
      redirect_to @whole_answer
    else
      flash.now[:danger] = '回答 は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @whole_answer = WholeAnswer.find(params[:id])
    @@whole_answer.destroy
    flash[:success] = '回答を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def whole_answer_params
    params.require(:whole_answer).permit(:book_id, :whole_question_id)
  end
end
