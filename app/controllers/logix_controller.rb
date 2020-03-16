class LogixController < ApplicationController
  # before_action :authenticate_user!

  MAXIMUM_FEATURED_CIRCUITS = 4

  def index
    @projects = Project.select("id,author_id,image_preview,name")
                       .where(project_access_type: "Public", forked_project_id: nil)
                       .paginate(page: params[:page]).order("id desc").limit(Project.per_page)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
      format.js
    end

    @featured_circuits = Project.joins(:featured_circuit).order("featured_circuits.created_at DESC")
      .limit(MAXIMUM_FEATURED_CIRCUITS)
  end

  def gettingStarted
  end

  def examples
    @example = [{name: "Full Adder from 2-Half Adders" , linkno: "247" , img: "examples/fullAdder_n.png"} , {name: "16 Bit ripple carry adder" , linkno: "248" , img: "examples/RippleCarry_n.jpeg"} , {name: "Asynchronous Counter" , linkno: "249" , img: "examples/AsyncCounter_n.jpeg"} , {name: "Keyboard" , linkno: "250" , img: "examples/Keyboard_n.jpeg"} , {name: "FlipFlop" , linkno: "251" , img: "examples/FlipFlop_n.jpeg"} , {name: "ALU 74LS181 by Ananth Shreekumar" , linkno: "252" , img: "examples/ALU_n.png"}]
  end

  def features
  end

  def all_user_index
  end

  def tos
  end

  def teachers
  end

  def contribute
  end
end
