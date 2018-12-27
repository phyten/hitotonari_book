class WholeAnswersController < ApplicationController
  
    
  def index
    @whole_answer = WholeAnswer.all
  end

  def show
    @whole_answer = WholeAnswer.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @whole_answer = Book.find(params[:book_id]).whole_answers.build
    
    # whole_questionsを持っておいて、１個ずつ減らしていく
    @whole_questions = WholeQuestion.where(required: true)
    @whole_answer.whole_question = @whole_questions.first
    @detailed_answers = Array.new
    @whole_questions.first.detailed_questions.each do |detailed_question|
    @whole_answer.detailed_answers.build(detailed_question_id: detailed_question.id)
    end
    
    # base_periodの選択部分を書く
    @base_periods = BasePeriod.where(book_id: @book.id)
    @whole_answer.periods.build
    
  end

  def create
    @whole_answer = Book.find(params[:book_id]).whole_answers.build(detailed_answer_params)
    if @whole_answer.save!
      flash[:success] = '回答を保存しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '回答保存に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @whole_answer = WholeAnswer.find(params[:id])
  end

  def update
    @whole_answer = WholeAnswer.find(params[:id])

    if @whole_answer.update(detailed_answer_params)
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

  def detailed_answer_params
    params.require(:whole_answer).permit(:whole_question_id, detailed_answers_attributes: [:content, :detailed_question_id], periods_attributes: [:base_period_id])
  end
  
end
    
