Dim App 'As Application
Set App = CreateObject("QuickTest.Application")
App.Launch
App.Visible = True

If Not App.TDConnection.IsConnected Then
	App.TDConnection.Connect "http://10.231.236.13:8080/qcbin/","CORE_SYSTEMS","GCM","gcholet","",False
Else
	'App.TDConnection.Disconnect
	
	'Perform a New connection 
	'Set QCConnection = CreateObject("TDApiOle80.TDConnection")
	'QCConnection.InitConnectionEx "http://10.231.236.13:8080"
	'QCConnection.login "gcholet", ""
	'QCConnection.Connect "CORE_SYETEMS","GCM"
	'msgbox QCConnection.ExtendedStorage.ClientPath
End If

excelPath = "J:\Automation\Application\Emerald\TestData\TEST\Global_Test_Data\Mapping_Sheet.xls"
strALMPath = "[QualityCenter]Subject\Automation_"
Set objExcel = CreateObject("Excel.Application")
objExcel.DisplayAlerts = 0
objExcel.Workbooks.open excelPath, false, true

'Total Worksheet Count
workSheetCount = objExcel.Worksheets.Count
iCounter = 1

'Get the WorkSheet
Set currentWorkSheet = objExcel.ActiveWorkbook.Worksheets(iCounter)
iUsedColumnsCount = currentWorkSheet.UsedRange.Columns.Count
iUsedRowsCount = currentWorkSheet.UsedRange.Rows.Count

Set Cells = currentWorksheet.Cells
iCurrColumn = 1 
For iRow = 2 to (iUsedRowsCount-1)
	strTestScript = Cells(iRow,iCurrColumn).Value
	If Instr(1, strTestScript, "SMOKE", 1) > 0 Then
		strCompletePath = strALMPath '& "Smoke\" & strTestScript
	ElseIf Instr(1, strTestScript, "REGRESSION", 1) > 0 Then
		strCompletePath = strALMPath '& "Regression\" & strTestScript
	Else
		strCompletePath = strALMPath
	End If
	
	App.open strCompletePath

	'Get the Script Data
	strContext = App.Test.Actions(1).GetScript

	'Repalce the  below Code with
	'"TestData\"& Environment("RUN_ENV") &"\"  ==> Environment.value("TestDataFileLocation")
	strCurrentContent = """TestData\""& Environment(""RUN_ENV"") &""\"""	
	strReplaceContent = "Environment.value(""TestDataFileLocation"")"
	strContext = Replace(strContext, strCurrentContent, strReplaceContent)

	'Msgbox App.Test.Actions(1).ValidateScript strContext
	App.Test.Actions(1).SetScript strContext
	App.Test.Save 

	'Msgbox App.Test.VerCtrlStatus
	'If App.Test.VerCtrlStatus = "CheckedOut" Then
	'    App.Test.CheckIn
	'End If
	'App.TDConnection.Disconnect
Next

objExcel.Workbooks(1).Close
objExcel.Quit

'Release Variables
Set currentWorkSheet = Nothing
Set objExcel = Nothing
Set App = Nothing
Set AppTest = Nothing