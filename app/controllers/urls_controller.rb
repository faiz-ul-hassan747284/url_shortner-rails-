class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Url.all

    render json: @urls
  end

  # GET /urls/1
  def show
    @url.clicks.create(browser: params[:browser], platform:params[:platform])
    redirect_to @url.url
  end

  # POST /urls
  def create
    @url = Url.new(url_params)

    if @url.save
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1
  def update
    if @url.update(url_params)
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
  end

  def metrics
    render json: build_metrics
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by(shortened_url: params[:shortened_url])
      render json: {message: 'No Url :( '}, :status => 404 unless @url
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:url).permit(:url)
    end

    def build_metrics
      {
        clicks_per_day: Click.group('date(created_at)').where(created_at:  Time.zone.now.beginning_of_month .. Time.zone.now).count(:id),
        clicks_per_browsers: Click.group('browser').where(created_at:  Time.zone.now.beginning_of_month .. Time.zone.now).count(:id),
        clicks_per_platforms: Click.group('platform').where(created_at:  Time.zone.now.beginning_of_month .. Time.zone.now).count(:id)

      }
    end
end
