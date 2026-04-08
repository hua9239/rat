if(typeof CourseFP == "undefined") CourseFP={};
if(typeof CourseFP.AjaxMethods_class == "undefined") CourseFP.AjaxMethods_class={};
CourseFP.AjaxMethods_class = function() {};
Object.extend(CourseFP.AjaxMethods_class.prototype, Object.extend(new AjaxPro.AjaxClass(), {
	CheckSession: function() {
		return this.invoke("CheckSession", {}, this.CheckSession.getArguments().slice(0));
	},
	GetTimeout: function() {
		return this.invoke("GetTimeout", {}, this.GetTimeout.getArguments().slice(0));
	},
	setLang: function(langCode) {
		return this.invoke("setLang", {"langCode":langCode}, this.setLang.getArguments().slice(1));
	},
	setCC: function(CurrentClassCode) {
		return this.invoke("setCC", {"CurrentClassCode":CurrentClassCode}, this.setCC.getArguments().slice(1));
	},
	GetTeacherInfo: function(targetCC, pageName) {
		return this.invoke("GetTeacherInfo", {"targetCC":targetCC, "pageName":pageName}, this.GetTeacherInfo.getArguments().slice(2));
	},
	LoadSMsg: function(targetCC) {
		return this.invoke("LoadSMsg", {"targetCC":targetCC}, this.LoadSMsg.getArguments().slice(1));
	},
	LoadCInfo: function(targetCC) {
		return this.invoke("LoadCInfo", {"targetCC":targetCC}, this.LoadCInfo.getArguments().slice(1));
	},
	GetCourseName: function(targetCC) {
		return this.invoke("GetCourseName", {"targetCC":targetCC}, this.GetCourseName.getArguments().slice(1));
	},
	GetMyScores: function(targetCC) {
		return this.invoke("GetMyScores", {"targetCC":targetCC}, this.GetMyScores.getArguments().slice(1));
	},
	GetDefaultPageString: function() {
		return this.invoke("GetDefaultPageString", {}, this.GetDefaultPageString.getArguments().slice(0));
	},
	GetSyllPageString: function() {
		return this.invoke("GetSyllPageString", {}, this.GetSyllPageString.getArguments().slice(0));
	},
	GetSyllabusData: function(targetCC, targetCS) {
		return this.invoke("GetSyllabusData", {"targetCC":targetCC, "targetCS":targetCS}, this.GetSyllabusData.getArguments().slice(2));
	},
	GetScheduleData: function(targetCC) {
		return this.invoke("GetScheduleData", {"targetCC":targetCC}, this.GetScheduleData.getArguments().slice(1));
	},
	GetSchePageString: function() {
		return this.invoke("GetSchePageString", {}, this.GetSchePageString.getArguments().slice(0));
	},
	GetMatePageString: function() {
		return this.invoke("GetMatePageString", {}, this.GetMatePageString.getArguments().slice(0));
	},
	GetMaterialData: function(targetCC) {
		return this.invoke("GetMaterialData", {"targetCC":targetCC}, this.GetMaterialData.getArguments().slice(1));
	},
	GetAnnoData: function(targetCC, pageNumber, remainRows) {
		return this.invoke("GetAnnoData", {"targetCC":targetCC, "pageNumber":pageNumber, "remainRows":remainRows}, this.GetAnnoData.getArguments().slice(3));
	},
	GetAnnoCount: function(targetCC) {
		return this.invoke("GetAnnoCount", {"targetCC":targetCC}, this.GetAnnoCount.getArguments().slice(1));
	},
	GetAnnoDetail: function(targetCC, TargetSN) {
		return this.invoke("GetAnnoDetail", {"targetCC":targetCC, "TargetSN":TargetSN}, this.GetAnnoDetail.getArguments().slice(2));
	},
	GetForumPageString: function() {
		return this.invoke("GetForumPageString", {}, this.GetForumPageString.getArguments().slice(0));
	},
	GetForumList: function(targetCC) {
		return this.invoke("GetForumList", {"targetCC":targetCC}, this.GetForumList.getArguments().slice(1));
	},
	GetThreadList: function(TargetSN, pageNumber, remainRows) {
		return this.invoke("GetThreadList", {"TargetSN":TargetSN, "pageNumber":pageNumber, "remainRows":remainRows}, this.GetThreadList.getArguments().slice(3));
	},
	GetForumData: function(targetSN) {
		return this.invoke("GetForumData", {"targetSN":targetSN}, this.GetForumData.getArguments().slice(1));
	},
	GetThreadRight: function(targetSN) {
		return this.invoke("GetThreadRight", {"targetSN":targetSN}, this.GetThreadRight.getArguments().slice(1));
	},
	GetPostList: function(TargetSN, pageNumber, remainRows) {
		return this.invoke("GetPostList", {"TargetSN":TargetSN, "pageNumber":pageNumber, "remainRows":remainRows}, this.GetPostList.getArguments().slice(3));
	},
	GetThreadData: function(TargetSN) {
		return this.invoke("GetThreadData", {"TargetSN":TargetSN}, this.GetThreadData.getArguments().slice(1));
	},
	GetPostRight: function(TargetSN) {
		return this.invoke("GetPostRight", {"TargetSN":TargetSN}, this.GetPostRight.getArguments().slice(1));
	},
	SavePost: function(threadSN, parentSN, title, content) {
		return this.invoke("SavePost", {"threadSN":threadSN, "parentSN":parentSN, "title":title, "content":content}, this.SavePost.getArguments().slice(4));
	},
	EditPost: function(threadSN, postSN, title, content) {
		return this.invoke("EditPost", {"threadSN":threadSN, "postSN":postSN, "title":title, "content":content}, this.EditPost.getArguments().slice(4));
	},
	DeletePost: function(threadSN, postSN, isThreadPost) {
		return this.invoke("DeletePost", {"threadSN":threadSN, "postSN":postSN, "isThreadPost":isThreadPost}, this.DeletePost.getArguments().slice(3));
	},
	SaveThread: function(forumSN, title, content) {
		return this.invoke("SaveThread", {"forumSN":forumSN, "title":title, "content":content}, this.SaveThread.getArguments().slice(3));
	},
	AddVC: function(TargetSN) {
		return this.invoke("AddVC", {"TargetSN":TargetSN}, this.AddVC.getArguments().slice(1));
	},
	AddAVC: function(TargetSN) {
		return this.invoke("AddAVC", {"TargetSN":TargetSN}, this.AddAVC.getArguments().slice(1));
	},
	GetPollData: function(targetCC, pollSN, showResult) {
		return this.invoke("GetPollData", {"targetCC":targetCC, "pollSN":pollSN, "showResult":showResult}, this.GetPollData.getArguments().slice(3));
	},
	GetPollCount: function(targetCC) {
		return this.invoke("GetPollCount", {"targetCC":targetCC}, this.GetPollCount.getArguments().slice(1));
	},
	PollVote: function(targetCC, pollSN, voteList) {
		return this.invoke("PollVote", {"targetCC":targetCC, "pollSN":pollSN, "voteList":voteList}, this.PollVote.getArguments().slice(3));
	},
	GetLoginString: function() {
		return this.invoke("GetLoginString", {}, this.GetLoginString.getArguments().slice(0));
	},
	Login: function(targetCC, userid, password) {
		return this.invoke("Login", {"targetCC":targetCC, "userid":userid, "password":password}, this.Login.getArguments().slice(3));
	},
	Logout: function() {
		return this.invoke("Logout", {}, this.Logout.getArguments().slice(0));
	},
	GetMenuString: function() {
		return this.invoke("GetMenuString", {}, this.GetMenuString.getArguments().slice(0));
	},
	GetYYMList: function() {
		return this.invoke("GetYYMList", {}, this.GetYYMList.getArguments().slice(0));
	},
	GetCourseList: function(YYM) {
		return this.invoke("GetCourseList", {"YYM":YYM}, this.GetCourseList.getArguments().slice(1));
	},
	GetHomeworkString: function() {
		return this.invoke("GetHomeworkString", {}, this.GetHomeworkString.getArguments().slice(0));
	},
	GetHomeworkList: function() {
		return this.invoke("GetHomeworkList", {}, this.GetHomeworkList.getArguments().slice(0));
	},
	GetWorkAttList: function(targetSN) {
		return this.invoke("GetWorkAttList", {"targetSN":targetSN}, this.GetWorkAttList.getArguments().slice(1));
	},
	CheckUpDone: function() {
		return this.invoke("CheckUpDone", {}, this.CheckUpDone.getArguments().slice(0));
	},
	GetLeaveData: function(targetCC, pageNumber, remainRows) {
		return this.invoke("GetLeaveData", {"targetCC":targetCC, "pageNumber":pageNumber, "remainRows":remainRows}, this.GetLeaveData.getArguments().slice(3));
	},
	GetLeaveCount: function(targetCC) {
		return this.invoke("GetLeaveCount", {"targetCC":targetCC}, this.GetLeaveCount.getArguments().slice(1));
	},
	GetLeaveDetail: function(targetCC, TargetDate, TS) {
		return this.invoke("GetLeaveDetail", {"targetCC":targetCC, "TargetDate":TargetDate, "TS":TS}, this.GetLeaveDetail.getArguments().slice(3));
	},
	GetPersonalString: function() {
		return this.invoke("GetPersonalString", {}, this.GetPersonalString.getArguments().slice(0));
	},
	GetAllAnnounce: function(pageSize) {
		return this.invoke("GetAllAnnounce", {"pageSize":pageSize}, this.GetAllAnnounce.getArguments().slice(1));
	},
	GetAllMaterial: function(pageSize) {
		return this.invoke("GetAllMaterial", {"pageSize":pageSize}, this.GetAllMaterial.getArguments().slice(1));
	},
	GetAllHomework: function(pageSize) {
		return this.invoke("GetAllHomework", {"pageSize":pageSize}, this.GetAllHomework.getArguments().slice(1));
	},
	GetAllPoll: function(pageSize) {
		return this.invoke("GetAllPoll", {"pageSize":pageSize}, this.GetAllPoll.getArguments().slice(1));
	},
	GetAllForum: function(pageSize) {
		return this.invoke("GetAllForum", {"pageSize":pageSize}, this.GetAllForum.getArguments().slice(1));
	},
	GetClassmateList: function() {
		return this.invoke("GetClassmateList", {}, this.GetClassmateList.getArguments().slice(0));
	},
	GetClassTList: function() {
		return this.invoke("GetClassTList", {}, this.GetClassTList.getArguments().slice(0));
	},
	GetProfileEdit: function() {
		return this.invoke("GetProfileEdit", {}, this.GetProfileEdit.getArguments().slice(0));
	},
	GetClassString: function() {
		return this.invoke("GetClassString", {}, this.GetClassString.getArguments().slice(0));
	},
	GetSetString: function() {
		return this.invoke("GetSetString", {}, this.GetSetString.getArguments().slice(0));
	},
	SaveProfile: function(dt) {
		return this.invoke("SaveProfile", {"dt":dt}, this.SaveProfile.getArguments().slice(1));
	},
	GetFeedbackString: function() {
		return this.invoke("GetFeedbackString", {}, this.GetFeedbackString.getArguments().slice(0));
	},
	GetSuggestionList: function(targetCC) {
		return this.invoke("GetSuggestionList", {"targetCC":targetCC}, this.GetSuggestionList.getArguments().slice(1));
	},
	GetReplyList: function(targetCC) {
		return this.invoke("GetReplyList", {"targetCC":targetCC}, this.GetReplyList.getArguments().slice(1));
	},
	AddFeedback: function(targetCC, fid, comment, target) {
		return this.invoke("AddFeedback", {"targetCC":targetCC, "fid":fid, "comment":comment, "target":target}, this.AddFeedback.getArguments().slice(4));
	},
	CheckMidQ: function() {
		return this.invoke("CheckMidQ", {}, this.CheckMidQ.getArguments().slice(0));
	},
	GetMoodleString: function() {
		return this.invoke("GetMoodleString", {}, this.GetMoodleString.getArguments().slice(0));
	},
	GetMoodleID: function(targetCC) {
		return this.invoke("GetMoodleID", {"targetCC":targetCC}, this.GetMoodleID.getArguments().slice(1));
	},
	GetVideoString: function() {
		return this.invoke("GetVideoString", {}, this.GetVideoString.getArguments().slice(0));
	},
	GetCourseVideos: function(targetCC) {
		return this.invoke("GetCourseVideos", {"targetCC":targetCC}, this.GetCourseVideos.getArguments().slice(1));
	},
	GetGlossaryString: function() {
		return this.invoke("GetGlossaryString", {}, this.GetGlossaryString.getArguments().slice(0));
	},
	GetCourseGlossary: function(targetCC) {
		return this.invoke("GetCourseGlossary", {"targetCC":targetCC}, this.GetCourseGlossary.getArguments().slice(1));
	},
	GetEMILink: function(targetCC) {
		return this.invoke("GetEMILink", {"targetCC":targetCC}, this.GetEMILink.getArguments().slice(1));
	},
	url: '/cfp/ajaxpro/CourseFP.AjaxMethods,App_Code.ashx'
}));
CourseFP.AjaxMethods = new CourseFP.AjaxMethods_class();
