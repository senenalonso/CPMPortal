class GraphsController < ApplicationController
	before_action :authenticate_user!

  def index
  end
 
  def global
    info_projects_global = Project.get_project_info_global()
    respond_to do |format|
      format.json {
        render :json => info_projects_global
      }
    end
  end
 
  def workload
    users = User.getAllUsers

    workload = Project.get_workload(users)

    respond_to do |format|
      format.json {
        render :json => workload      
      }
    end
  end
 
  def requests 
    respond_to do |format|
      format.json {
        render :json => [{"label":'01\'16',"abiertas":'12',"cerradas":'1',"rechazadas":'2'},
                        {"label":'02\'16',"abiertas":'16',"cerradas":'2',"rechazadas":'4'},
                        {"label":'03\'16',"abiertas":'22',"cerradas":'3',"rechazadas":'1'},
                        {"label":'04\'16',"abiertas":'11',"cerradas":'4',"rechazadas":'0'},
                        {"label":'05\'16',"abiertas":'7',"cerradas":'5',"rechazadas":'6'},
                        {"label":'06\'16',"abiertas":'15',"cerradas":'6',"rechazadas":'4'},
                        {"label":'07\'16',"abiertas":'12',"cerradas":'7',"rechazadas":'3'},
                        {"label":'08\'16',"abiertas":'4',"cerradas":'8',"rechazadas":'2'},
                        {"label":'09\'16',"abiertas":'25',"cerradas":'6',"rechazadas":'1'},
                        {"label":'10\'16',"abiertas":'11',"cerradas":'5',"rechazadas":'6'},
                        {"label":'11\'16',"abiertas":'16',"cerradas":'7',"rechazadas":'7'},
                        {"label":'12\'16',"abiertas":'8',"cerradas":'9',"rechazadas":'10'},
                        {"label":'01\'17',"abiertas":'12',"cerradas":'12',"rechazadas":'2'},
                        {"label":'02\'17',"abiertas":'15',"cerradas":'13',"rechazadas":'1'},
                        {"label":'03\'17',"abiertas":'19',"cerradas":'24',"rechazadas":'3'}]      
      }
    end
  end
 
  def tests 
    respond_to do |format|
      format.json {
        render :json => [{"label":'01\'16',"aceptado":'12',"aceptado con riesgo":'1',"rechazado":'2',"no aplica":'3'},
                        {"label":'02\'16',"aceptado":'16',"aceptado con riesgo":'2',"rechazado":'4',"no aplica":'3'},
                        {"label":'03\'16',"aceptado":'22',"aceptado con riesgo":'3',"rechazado":'1',"no aplica":'3'},
                        {"label":'04\'16',"aceptado":'11',"aceptado con riesgo":'4',"rechazado":'0',"no aplica":'3'},
                        {"label":'05\'16',"aceptado":'7',"aceptado con riesgo":'5',"rechazado":'6',"no aplica":'3'},
                        {"label":'06\'16',"aceptado":'15',"aceptado con riesgo":'6',"rechazado":'4',"no aplica":'3'},
                        {"label":'07\'16',"aceptado":'12',"aceptado con riesgo":'7',"rechazado":'3',"no aplica":'3'},
                        {"label":'08\'16',"aceptado":'4',"aceptado con riesgo":'8',"rechazado":'2',"no aplica":'3'},
                        {"label":'09\'16',"aceptado":'25',"aceptado con riesgo":'6',"rechazado":'1',"no aplica":'3'},
                        {"label":'10\'16',"aceptado":'11',"aceptado con riesgo":'5',"rechazado":'6',"no aplica":'3'},
                        {"label":'11\'16',"aceptado":'16',"aceptado con riesgo":'7',"rechazado":'7',"no aplica":'3'},
                        {"label":'12\'16',"aceptado":'8',"aceptado con riesgo":'9',"rechazado":'10',"no aplica":'3'},
                        {"label":'01\'17',"aceptado":'12',"aceptado con riesgo":'12',"rechazado":'2',"no aplica":'3'},
                        {"label":'02\'17',"aceptado":'15',"aceptado con riesgo":'13',"rechazado":'1',"no aplica":'3'},
                        {"label":'03\'17',"aceptado":'19',"aceptado con riesgo":'24',"rechazado":'3',"no aplica":'3'}]      
      }
    end
  end

end