class RemoveDocumentoFromUsuario < ActiveRecord::Migration[5.1]
  def change
    remove_column :usuarios, :tipo_de_documento, :string
  end
end
