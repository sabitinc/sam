<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="co.edu.unal.sam.aspect.properties.ReadFromPropertiesFile"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="title" scope="session"
	value="${ReadFromPropertiesFile.getProperties('param.administrador.title')}" />

<c:set var="req" value="${pageContext.request}" />
<c:set var="url" value="${req.requestURL}" />
<c:set var="uri" value="${req.requestURI}" />

<!-- consulta personalizada por Pagina -->
<c:set var="titlePageAdministrator" scope="session" value="titlePageAdministrator" />
<c:set var="namePageAdministrator" scope="session" value="Home de Paginas" />
<c:set var="classPageAdministrator" scope="session" value="fa-sitemap" />
<c:set var="nameAllPageAdministrator" scope="session" value="All Psges" />

<!-- End consulta personalizada-->



<t:admintemplate>	
	<jsp:attribute name="title">
		${titlePageAdministrator}
	</jsp:attribute>
	<jsp:body>	
		<!--Div Wrapper-->
    	<div id="wrapper"  style="min-height: 278px;" ng-controller="PageController as ctrl">
			
			<!--Component Navbar-->
			<jsp:include page="component/Navbar.jsp">
			  <jsp:param name="usernameLogger" value="Fredy Gonzalo Captuayo Novoa" />
			  <jsp:param name="userLogger" value="FCAPTUAYO" />
			</jsp:include>
			<!--End Component Navbar-->

			<!--Div Page Wrapper-->
        	<div id="page-wrapper" class="row">
	           
            	<!-- Div .col-lg-12 -->
                <div class="col-xs-12 col-sm-9 panel">
                    <h1 class="row">
						<i class="btn-info btn-circle fa ${classPageAdministrator} fa-fw"></i>
						${namePageAdministrator}
                    </h1>
                
					<uib-accordion>
						<uib-accordion-group 
							heading="Static Header, initially expanded" 
							is-open="status.isFirstOpen" 
							panel-class="panel-red" 
							>
							<uib-accordion-heading>
								<div 
								ng-class="{'panel-heading letterSmall': 
					        						!status.isFirstOpen, 
					        						'panel-heading': 
					        						status.isFirstOpen}"
								>
					                <div>
<spring:message code="param.component.form"/>
										<i class="pull-right glyphicon" 
					        			ng-class="{'glyphicon-chevron-down': 
					        						!status.isFirstOpen, 
					        						'glyphicon-chevron-right': 
					        						status.isFirstOpen}">
					        			</i>
					        		</div>
					           	</div>
      						</uib-accordion-heading>

			<!--Component Navbar-->
				<jsp:include page="component/pageManagement/FormPage.jsp">
				  <jsp:param name="usernameLogger" value="Fredy Gonzalo Captuayo Novoa" />
				</jsp:include>
			<!--End Component Navbar-->

						</uib-accordion-group>
					</uib-accordion> 
					<div class="pull-right" uib-collapse="!status.isFirstOpen">
							<a href="" ng-click="status.isFirstOpen = !status.isFirstOpen"  class=" next ng-binding">
								All Pages 
							</a>
					</div>
	            </div>
	            
	            
	            <div class="col-xs-6 col-sm-3 panel">
					<em>
						<h4 class="row">
								Pages
                                <span class="pull-right">
										<i class="pull-right glyphicon" 
					        			ng-class="{'glyphicon-remove btn btn-danger btn-circle': 
					        						status.isFirstOpen, 
					        						'glyphicon-arrow-down btn btn-info btn-circle': 
					        						!status.isFirstOpen}"
					        			ng-click="status.isFirstOpen = !status.isFirstOpen" 			
					        					>
					        			</i>
                                </span>
						</h4>

					</em>

					<div class="col-sm-12" uib-collapse="!status.isFirstOpen">
						<jsp:include page="component//pageManagement/ListRecentPage.jsp"/> 
					</div>
					<div class="pull-right" uib-collapse="!status.isFirstOpen">
							<a href="" ng-click="status.isFirstOpen = !status.isFirstOpen"  class=" next ng-binding">
${nameAllPageAdministrator}
							</a>
					</div>
	            </div>

	            <div class="col-lg-12">
					<div uib-collapse="status.isFirstOpen" class="">
						<jsp:include page="component//pageManagement/ListPage.jsp"/> 
					</div>
				</div>
				 
     		</div>       
          	<!--End Div Page Wrapper-->                   

			<!--Statement Footer-->
			<div class="col-lg-12 ">
				<jsp:include page="component/Footer.jsp"/> 	
			</div>
			<!--End Component Navbar-->
			
			                   
		</div>
		<!--End Div Wrapper-->
	

	
		<!-- Statement JScript-->
			<!-- Angular Touch Core JavaScript -->
			<script src="<c:url value='/static/js/physicalactivity/service/crud_service.js' />"></script>
			<!-- Angular Touch Core JavaScript -->
			<script src="<c:url value='/static/js/physicalactivity/service/enum_service.js' />"></script>
			<!-- Angular Touch Core JavaScript -->
			<script src="<c:url value='/static/js/physicalactivity/controller/page_controller.js' />"></script>
		<!-- End Statement JScript-->

    </jsp:body>
</t:admintemplate>
