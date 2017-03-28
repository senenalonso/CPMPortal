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
        render :json => [{"name":'01/2016',"abiertas":'12',"cerradas":'1',"rechazadas":'2'},
                        {"name":'02/2016',"abiertas":'16',"cerradas":'2',"rechazadas":'4'},
                        {"name":'03/2016',"abiertas":'22',"cerradas":'3',"rechazadas":'1'},
                        {"name":'04/2016',"abiertas":'11',"cerradas":'4',"rechazadas":'0'},
                        {"name":'05/2016',"abiertas":'7',"cerradas":'5',"rechazadas":'6'},
                        {"name":'06/2016',"abiertas":'15',"cerradas":'6',"rechazadas":'4'},
                        {"name":'07/2016',"abiertas":'12',"cerradas":'7',"rechazadas":'3'},
                        {"name":'08/2016',"abiertas":'4',"cerradas":'8',"rechazadas":'2'},
                        {"name":'09/2016',"abiertas":'25',"cerradas":'6',"rechazadas":'1'},
                        {"name":'10/2016',"abiertas":'11',"cerradas":'5',"rechazadas":'6'},
                        {"name":'11/2016',"abiertas":'16',"cerradas":'7',"rechazadas":'7'},
                        {"name":'12/2016',"abiertas":'8',"cerradas":'9',"rechazadas":'10'},
                        {"name":'01/2017',"abiertas":'12',"cerradas":'12',"rechazadas":'2'},
                        {"name":'02/2017',"abiertas":'15',"cerradas":'13',"rechazadas":'1'},
                        {"name":'03/2017',"abiertas":'19',"cerradas":'24',"rechazadas":'3'}]      
      }
    end
  end
 
  def tests 
    respond_to do |format|
      format.json {
        render :json => [{"name":'01/2016',"aceptado":'12',"aceptado con riesgo":'1',"rechazado":'2',"no aplica":'3'},
                        {"name":'02/2016',"aceptado":'16',"aceptado con riesgo":'2',"rechazado":'4',"no aplica":'3'},
                        {"name":'03/2016',"aceptado":'22',"aceptado con riesgo":'3',"rechazado":'1',"no aplica":'3'},
                        {"name":'04/2016',"aceptado":'11',"aceptado con riesgo":'4',"rechazado":'0',"no aplica":'3'},
                        {"name":'05/2016',"aceptado":'7',"aceptado con riesgo":'5',"rechazado":'6',"no aplica":'3'},
                        {"name":'06/2016',"aceptado":'15',"aceptado con riesgo":'6',"rechazado":'4',"no aplica":'3'},
                        {"name":'07/2016',"aceptado":'12',"aceptado con riesgo":'7',"rechazado":'3',"no aplica":'3'},
                        {"name":'08/2016',"aceptado":'4',"aceptado con riesgo":'8',"rechazado":'2',"no aplica":'3'},
                        {"name":'09/2016',"aceptado":'25',"aceptado con riesgo":'6',"rechazado":'1',"no aplica":'3'},
                        {"name":'10/2016',"aceptado":'11',"aceptado con riesgo":'5',"rechazado":'6',"no aplica":'3'},
                        {"name":'11/2016',"aceptado":'16',"aceptado con riesgo":'7',"rechazado":'7',"no aplica":'3'},
                        {"name":'12/2016',"aceptado":'8',"aceptado con riesgo":'9',"rechazado":'10',"no aplica":'3'},
                        {"name":'01/2017',"aceptado":'12',"aceptado con riesgo":'12',"rechazado":'2',"no aplica":'3'},
                        {"name":'02/2017',"aceptado":'15',"aceptado con riesgo":'13',"rechazado":'1',"no aplica":'3'},
                        {"name":'03/2017',"aceptado":'19',"aceptado con riesgo":'24',"rechazado":'3',"no aplica":'3'}]      
      }
    end
  end

end