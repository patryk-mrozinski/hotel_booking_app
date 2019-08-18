module ForCompany
  class ImagesController < BaseController
    def destroy
      blob = ActiveStorage::Blob.find(params[:id])
      attachment = ActiveStorage::Attachment.find_by(blob_id: blob.id)
      record = attachment.record

      attachment.destroy
      blob.destroy

      redirect_to [:for_company, record]
    end
  end
end
