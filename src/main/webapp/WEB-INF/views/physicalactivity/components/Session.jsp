<script type="text/javascript">
  var sessionUserID = "${sessionScope.user.id}";
  var sessionUserUsername = "${sessionScope.user.username}";
  var sessionUserName = "${sessionScope.user.name}";
  var sessionUserSurname = "${sessionScope.user.surname}";
  var sessionUserEmail = "${sessionScope.user.email}";
  var sessionUserIdentityDocument = "${sessionScope.user.identityDocument}";
  var sessionUserAge = "${sessionScope.user.age}";
  var sessionUserHeight = parseFloat("${sessionScope.user.height}");
  var sessionUserWeight = parseFloat("${sessionScope.user.weight}");
  var sessionUserProgress = parseFloat("${sessionScope.user.progress}");
  var sessionUserRisk = "${sessionScope.user.risk.name}";
</script>