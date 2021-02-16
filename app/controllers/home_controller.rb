class HomeController < ApplicationController
  signed_in!

  # GET /home
  def index
  end

  # GET /home/transfers
  def transfers
    @transfers = current_org.transfers
  end

  # POST /home/upload_transfers
  # params[] :file
  def upload_transfers
    file = params[:file] # ActionDispatch::Http::UploadedFile

    if file.present?
      a = current_org.transfers.count
      b = TransferService.import(current_org, file.to_path)
      c = current_org.transfers.count

      flash[:notice] = "Arquivo recebido. #{b} Linhas em branco. #{c-a} Transferencias registradas"
    else
      flash[:notice] = "Voce se esqueceu de anexar um arquivo CNAB"
    end

    redirect_to :home_transfers
  end
end
