class FuploadRails::UploadsController < ApplicationController
  def index
    @assets = FuploadRails::Asset.all
    render :json => @assets.to_json
  end

  def create
    @asset = FuploadRails::Asset.new

    file = params[:qqfile]
    if params[:assetable_id] && asset_obj = (params[:assetable_type].constantize rescue nil)
      asset_obj = asset_obj.find(params[:assetable_id])
      @asset.assetable = asset_obj if asset_obj
    end
    @asset.data = RedactorRails::Http.normalize_param(file, request)

    if @asset.save
      render :json => {:success => true}#{ :filelink => @asset.url }.to_json
    else
      render :json => {:error => @asset.errors.full_messages.join('. ')}
    end
  end

  def destroy
    asset = FuploadRails::Asset.find_by_id(params[:id])
    asset.destroy

    redirect_to request.referrer
  end
end

