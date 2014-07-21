class KpFilesController < ApplicationController
  # GET /kp_files
  # GET /kp_files.json
  def index
    @kp_files = KpFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kp_files }
    end
  end

  # GET /kp_files/1
  # GET /kp_files/1.json
  def show
    @kp_file = KpFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kp_file }
    end
  end

  # GET /kp_files/new
  # GET /kp_files/new.json
  def new
    @kp_file = KpFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kp_file }
    end
  end

  # GET /kp_files/1/edit
  def edit
    @kp_file = KpFile.find(params[:id])
  end

  # POST /kp_files
  # POST /kp_files.json
  def create
    @kp_file = KpFile.new(params[:kp_file])

    respond_to do |format|
      if @kp_file.save
        format.html { redirect_to @kp_file, notice: 'Kp file was successfully created.' }
        format.json { render json: @kp_file, status: :created, location: @kp_file }
      else
        format.html { render action: "new" }
        format.json { render json: @kp_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kp_files/1
  # PUT /kp_files/1.json
  def update
    @kp_file = KpFile.find(params[:id])

    respond_to do |format|
      if @kp_file.update_attributes(params[:kp_file])
        format.html { redirect_to @kp_file, notice: 'Kp file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kp_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kp_files/1
  # DELETE /kp_files/1.json
  def destroy
    @kp_file = KpFile.find(params[:id])
    @kp_file.destroy

    respond_to do |format|
      format.html { redirect_to kp_files_url }
      format.json { head :no_content }
    end
  end
end
