class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def tehran
  end

  def esfehan
  end

  def ghom  
  end

  def gilan
  end

  def golestan
  end

  def mazandaran
  end

  def kerman
  end

  def kermanshah
  end

  def azarbayjansharghi
  end

  def azarbayjangharbi
  end

  def ardebil
  end

  def eilam
  end

  def boushehr
  end

  def charmahalebakhtiari
  end

  def khorasanjounubi
  end

  def khorasanshomali
  end

  def khorasanrazavi
  end

  def khuzestan
  end

  def zanjan
  end

  def systanvabalouchestan
  end

  def semnan
  end

  def fars
  end

  def ghazvin
  end

  def kohgiluyevabayerahmad
  end

  def kordestan
  end

  def lorestan
  end

  def markazi
  end

  def hormozgan
  end

  def hamedan
  end

  def yazd
  end

  def alborz
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name)
    end
end
