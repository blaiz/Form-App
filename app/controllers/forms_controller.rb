class FormsController < ApplicationController
  # GET /forms
  # GET /forms.json
  def index
    @questionnaire = Questionnaire.find(params[:questionnaire_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @forms }
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find_by_name(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @form }
    end
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @form = Form.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @form }
    end
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find_by_name(params[:id])
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(params[:form])
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @form.questionnaire = @questionnaire
    @questionnaire.start_form = @form if @questionnaire.start_form.nil?
 
    respond_to do |format|
      if @form.save and @questionnaire.save
        format.html { redirect_to questionnaire_forms_path(@questionnaire), :notice => 'Form was successfully created.' }
        format.json { render :json => @form, :status => :created, :location => @form }
      else
        format.html { render :action => "new" }
        format.json { render :json => @form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find_by_name(params[:id])

    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to @form, :notice => 'Form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find_by_name(params[:id])
    @form.destroy

    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end
end
