class CatsController <  ApplicationController 
  def index 
    @cats = Cat.all
    render :index 
  end

  def show 
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show 
    else
      redirect_to cats_url
    end 
  end 

  def new
    # @cat = Cat.new(cats_param)
    render :new 
  end

  def create 
    @cat = Cat.new(cats_param)
    if @cat.save 
      redirect_to cat_url(@cat)
    else 
      render json: @cat.errors.full_messages, status: 422
    end 
  end

  def edit
    @cat = cat.find_by(id: params[:id])
    # @cat.persisted? #=> true
    if @cat 
        render :edit
    else 
        redirect_to cats_url
    end
  end

  private
  def cats_param 
    params.require(:cat).permit(:birth_date, :color, :name, :sex)
  end 
end