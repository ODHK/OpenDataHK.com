class ProjectRolesController < ApplicationController

  # GET /project_roles
  # GET /project_roles.json
  def index
    @project_roles = ProjectRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_roles }
    end
  end

  # GET /project_roles/1
  # GET /project_roles/1.json
  def show
    @project_role = ProjectRole.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_role }
    end
  end

  # GET /project_roles/new
  # GET /project_roles/new.json
  def new
    # authorize! :create, ProjectRole
  
    @project_role = ProjectRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_role }
    end
  end

  # GET /project_roles/1/edit
  def edit
    @project_role = ProjectRole.find(params[:id])
  end

  # POST /project_roles
  # POST /project_roles.json
  def create
    authorize! :create, ProjectRole
    params[:project_role]['role'] = "member"
    @project_role = ProjectRole.where(params[:project_role]).first_or_create()

    respond_to do |format|
      if @project_role.save
        format.html { redirect_to @project_role, notice: 'ProjectRole was successfully created.' }
        format.json { render json: @project_role, status: :created, location: @project_role }
      else
        format.html { render action: "new" }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_roles/1
  # PUT /project_roles/1.json
  def update
    @project_role = ProjectRole.find(params[:id])

    respond_to do |format|
      if @project_role.update_attributes(params[:project])
        format.html { redirect_to @project_role, notice: 'ProjectRole was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_roles/1
  # DELETE /project_roles/1.json
  def destroy

    @project_role = ProjectRole.find(params[:project_role]["id"])
    @project_role.destroy

    respond_to do |format|
      format.html { redirect_to project_roles_url }
      format.json { head :no_content }
    end
  end
end