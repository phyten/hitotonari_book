class WholeAnswersController < ApplicationController
  
    
  def index
    @wa = WholeAnswer.all
  end

  def show
    @wa = WholeAnswer.find(params[:id])
  end

  def new
    @whole_answer = WholeAnswer.new
    WholeQuestion.detailed_question_length.times.each do |c|
    @whole_answer.detailed_answers.build
    @whole_answer.periods.build
  end

  def create
    @wa = current_user.whole_answers.build(whole_answer_params)
    if @wa.save
      flash[:success] = '回答を保存しました。'
      redirect_to root_url
    else
      @wa = current_user.whole_answers.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '回答保存に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @wa = WholeAnswer.find(params[:id])
  end

  def update
    @wa = WholeAnswer.find(params[:id])

    if @wa.update(whole_answer_params)
      flash[:success] = '回答 は正常に更新されました'
      redirect_to @whole_answer
    else
      flash.now[:danger] = '回答 は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @wa = WholeAnswer.find(params[:id])
    @wa.destroy
    flash[:success] = '回答を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def whole_answer_params
    params.require(:whole_answer).permit(:book_id, :whole_question_id)
  end
end
