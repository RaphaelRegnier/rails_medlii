class RemoveUserReferencesFromConversation < ActiveRecord::Migration[5.0]
  def change
    remove_column :conversations, :sender_id
    remove_column :conversations, :recipient_id
  end
end
