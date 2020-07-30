class AddPictureAttachmentToExpeditions < ActiveRecord::Migration[6.0]
  def change
    add_attachment :expeditions, :picture
  end
end
