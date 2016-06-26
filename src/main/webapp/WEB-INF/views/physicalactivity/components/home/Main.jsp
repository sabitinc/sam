<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<input type="hidden" name="id" value="ctrl.goals.id"
	ng-model="ctrl.goals.id" />

<div class="col-lg-12 text-muted">
	<!-- Tips -->
	<div class="panel panel-orange-sports  panel-default-white">
		<div class="panel-heading">
			<spring:message code="param.physicalactivity.classify.morris.title" />
		</div>
		<div class="panel-body">
			<div donut-chart="" donut-data="ctrl.chartData"
				donut-colors="ctrl.chartColors" donut-formatter="ctrl.myFormatter"></div>
			<span class="pull-right"> <a
				href="/physicalactivity/goalsform"
				class="btn btn btn-info pull-left"><spring:message
						code="param.physicalactivity.home.morris.activities.button" /></a>
			</span>
		</div>
	</div>

</div>

<div class="col-lg-8 text-muted">
	<!-- Tips -->
	<div class="panel panel-orange-sports  panel-default-white">
		<div class="panel-heading">
			<spring:message code="param.physicalactivity.tip" />
		</div>
		<div class="panel-body">
			<ul class="chat" ng-repeat="tip in listTips">
				<li class="left clearfix">
					<div class="clearfix">
						<p>{{tip.name}}</p>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- Alert -->
	<div class="panel panel-orange-sports  panel-default-white">
		<div class="panel-heading">
			<spring:message code="param.physicalactivity.alert" />
		</div>
		<div class="panel-body">
			<ul class="chat" ng-repeat="alert in listAlerts">
				<li class="left clearfix">
					<div class="clearfix">
						<p ng-bind-html="alert.name"></p>
						<p>{{alert.name}}</p>
					</div>
				</li>
			</ul>
		</div>
	</div>


	<!-- 	<!-- Myth -->

	<!-- 	<div class="panel panel-orange-sports  panel-default-white"> -->
	<!-- 		<div class="panel-heading"> -->
	<%-- 			<spring:message code="param.physicalactivity.myth" /> --%>
	<!-- 		</div> -->
	<!-- 		<div class="panel-body"> -->
	<!-- 			<ul class="chat" ng-repeat="myth in listMyths"> -->
	<!-- 				<li class="left clearfix"> -->
	<!-- 					<div class="clearfix"> -->
	<!-- 						<p>{{myth.name}}</p> -->
	<!-- 					</div> -->
	<!-- 				</li> -->
	<!-- 			</ul> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

</div>

<div class="col-lg-4 text-muted">
	<!-- Advantage -->
	<div class="panel panel-orange-sports  panel-default-white">
		<div class="panel-heading">
			<spring:message code="param.physicalactivity.advantage" />
		</div>
		<div class="panel-body">
			<ul class="chat" ng-repeat="advantage in listAdvantages">
				<li class="left clearfix">
					<div class="clearfix">
						<p>{{advantage.name}}</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>


<div class="col-lg-12 text-muted">
	<div class="panel panel-orange-sports  panel-default-white">
		<div class="panel-heading">
			<spring:message
				code="param.physicalactivity.home.morris.specific.goals" />
		</div>
		<div class="panel-body">

			<fieldset class="col-md-6" ng-repeat="goals in ctrl.listGoals">
				<div donut-chart="" donut-data="goals.activity"
					donut-colors="ctrl.chartColors" donut-formatter="ctrl.myFormatter"></div>

				<h4 class=" text-center text-muted  control-lable ">Min
					Semanales:{{goals.totalsemanaminutes}}</h4>
				<h4 class=" text-center text-muted  control-lable ">Min
					Mesuales:{{goals.totalmesminutes}}</h4>
			</fieldset>
			<span class="pull-right"> <a
				href="/physicalactivity/goalsform"
				class="btn btn btn-info pull-left"><spring:message
						code="param.physicalactivity.home.morris.activities.button" /></a>
			</span>

		</div>
	</div>
</div>



<!-- End Div Panel Custom Field -->
