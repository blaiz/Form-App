class FormInstancesController < ApplicationController
  # GET /form_instances
  # GET /form_instances.json
  def index
    @form = Form.includes(:form_instances, :respondents).find_by_url(params[:form_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @form }
    end
  end

  # GET /form_instances/1
  # GET /form_instances/1.json
  def show
    @form_instance = FormInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @form_instance }
    end
  end

  # GET /form_instances/new
  # GET /form_instances/new.json
  def new
    @form_instance = FormInstance.new
    @form_instance.form = Form.find_by_url(params[:form_id])
    @form_instance.respondent = Respondent.find(1)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @form_instance }
    end
  end

  # GET /form_instances/1/edit
  def edit
    @form_instance = FormInstance.find(params[:id])
  end

  # POST /form_instances
  # POST /form_instances.json
  def create
    @form_instance = FormInstance.new
    @form_instance.form = Form.find(params[:form_id])
    @form_instance.respondent = Respondent.find(1)
    
    params[:field].each do |id,value|
      Response.create(:form_field_id => id, :form_instance => @form_instance, :value => value) unless value.blank?
    end

    respond_to do |format|
      if @form_instance.save
        if (@form_instance.form.next_form.nil?)
          format.html { redirect_to @form_instance, :notice => 'Form instance was successfully created.' }
          format.json { render :json => @form_instance, :status => :created, :location => @form_instance }
        else
          format.html { redirect_to new_form_form_instance_path(@form_instance.form.next_form), :notice => 'Form instance was successfully created.' }
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @form_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /form_instances/1
  # PUT /form_instances/1.json
  def update
    @form_instance = FormInstance.find(params[:id])
    
    params[:field].each do |id,value|
      if (response = @form_instance.responses.find_by_form_field_id(id))
        if (value.blank?)
          response.destroy
        else
          response.update_attributes(:value => value)
        end
      else
        Response.create(:form_field_id => id, :form_instance => @form_instance, :value => value) unless value.blank?
      end
    end

    respond_to do |format|
      if @form_instance.update_attributes(params[:form_instance])
        if (@form_instance.next_form_instance.nil?)
          if (@form_instance.form.next_form.nil?)
            format.html { redirect_to @form_instance, :notice => 'Form instance was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { redirect_to new_form_form_instance_path(@form_instance.form.next_form), :notice => 'Form instance was successfully updated.' }
          end
        else
          format.html { redirect_to edit_form_instance_path(@form_instance.next_form_instance), :notice => 'Form instance was successfully updated.' }
        end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @form_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /form_instances/1
  # DELETE /form_instances/1.json
  def destroy
    @form_instance = FormInstance.find(params[:id])
    @form_instance.destroy

    respond_to do |format|
      format.html { redirect_to form_instances_url }
      format.json { head :no_content }
    end
  end
end
