class ProjectsController < ApplicationController

def render_markdown(markup)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      :tables => true,
      :no_intra_emphasis => true,
      :fenced_code_blocks => true,
      :lax_spacing => true,
      :space_after_headers => true,
      })
    markdown.render(markup)
  end

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @projects = @projects.map!{|p| 
      p.description = render_markdown(p.description)
      p
    }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @project.description = render_markdown(@project.description)
    @project["owner"] = @project.project_roles.detect{|p| p.role == "owner"}.user
    # @project["members"] = @project.project_roles.select{|p| p.role == "member"}
    @members = @project.project_roles.select{|p| p.role == "member"}
    @project["members"] = @members.map{|m| User.find(m.user_id)}
    if current_user
      @project_role = @project.project_roles.select{|p| p.id if p.user_id == current_user.id && p.role == 'member' }
      unless @project_role.empty? 
        @project_role = @project_role.first[:id]
      end
    @users = User.all.map{|user| {'id' => user.id, 'name' => user.name}}
    end

    @microbes = Microbe.all include: :user 
    @microbe = Microbe.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
      format.js
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    authorize! :create, Project
  
    @project = Project.new
    puts @project

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    authorize! :create, Project

    @project = Project.new(params[:project])
    @role = ProjectRole.new()
    @role.user = current_user
    @role.project = @project
    @role.role = "owner"
    @role.save
    ap @role

    puts @project
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
