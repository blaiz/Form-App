class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @response }
    end
  end

  # GET /respond/form_id
  def edit
    @form = Form.find_by_url(params[:id])
    @form_fields = FormField.order('weight ASC').find_all_by_form_id(@form.id)
    form_field_ids = Array.new
    @form_fields.each do |f|
      form_field_ids.push(f.id)
    end
    @responses = Array.new
    Response.find_all_by_form_field_id_and_respondent_id(form_field_ids, 1).each do |d|
      @responses[d.form_field_id] = d
    end
  end

  # PUT /respond/form_id
  # PUT /respond/form_id
  def update
    @form = Form.find(params[:form_id])
    
    params[:field].each do |id,value|
      if (response = Response.find_by_form_field_id_and_respondent_id(id, 1))
        if (value.blank?)
          response.destroy
        else
          response.update_attributes(:value => value)
        end
      else
        Response.create(:form_field_id => id, :respondent_id => 1, :value => value) unless value.blank?
      end
    end
    
    respond_to do |format|
      format.html { redirect_to "/" }
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end
end
