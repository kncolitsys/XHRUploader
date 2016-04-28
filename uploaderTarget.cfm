<cfsilent>
	<cfcontent type="application/json" />
	<cftry>
		<cfset stRequest = getHTTPRequestData() />
		<cfset binFileContent = stRequest.content />
		<cfset sFileName = stRequest.headers["X-File-Name"] />
		<cfset sFileNameAndPath = "#expandPath('.')#/#sFileName#" />
		<cffile action="write"
			file="#expandPath('.')#/#sFileName#"
			output="#binFileContent#"
			addnewline="false" />
		<cfsavecontent variable="sJSON"><cfoutput>{"success":true, "fileName":"#JSStringFormat(sFileName)#", "fileNameAndPath":"#JSStringFormat(sFileNameAndPath)#"}</cfoutput></cfsavecontent>

		<cfcatch type="any">
			<cfsavecontent variable="sJSON"><cfoutput>{"success":false, "message":"#cfcatch.message#", "detail":"#cfcatch.detail#"}</cfoutput></cfsavecontent>
		</cfcatch>
	</cftry>
</cfsilent><cfoutput>#sJSON#</cfoutput>