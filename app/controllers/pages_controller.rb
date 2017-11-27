class PagesController < ApplicationController
  def index
    # All Blog Pages
    @pages = Page.all
  end

  def show
    # Finding a page by id from the database and giving the view access
    @page = Page.find(params[:id])
  end

  def edit
    # Shows a pre filled template to edit the page
    @page = Page.find(params[:id])
  end

  def update
    # Take data from the form and update the page in our database
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to page_path(@page)
      # successful update
    else
      # failed update
      render :edit
    end
  end

  def new
    # Shows a blank form to create a new page
    @page = Page.new
  end

  def create
    # Take date from form and create a new page in our database
    @page = Page.new(page_params)
    if @page.save
      # success
      redirect_to pages_path
    else
      # fail
      render :new
    end
  end

  def destroy
    # Finds the page by ID and removes it from the database
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private

  # Strong Params
  def page_params
    # same as params[:page]
    params.require(:page).permit(:title, :author, :content, :public)
  end
end
