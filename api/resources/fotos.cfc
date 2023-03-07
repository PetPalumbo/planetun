<cfcomponent extends="taffy.core.resource" taffy:uri="/fotos/ocorrencia/{ocorrenciaId}">

	<cffunction name="get">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfset var local = {} />
		<cfquery name="local.qGetFotos">
			SELECT id, ocorrencia_id, link FROM foto
			WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn representationOf( local.qGetFotos ) />
	</cffunction>

	<cffunction name="post">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfargument name="link" required="false" default="" />
		<cfset var local = {} />

		<cffile
			action="upload"
			destination="#expandPath('/upload/')#"
			fileField="link"
			nameConflict="MakeUnique"
		/>
		<cfset imageTemp = Cffile.ServerFile>

		<cfquery name="local.qPostFoto">
			INSERT INTO foto (ocorrencia_id, link) VALUES (
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#imageTemp#" />
			)
		</cfquery>
		<cfreturn noData() />
	</cffunction>

</cfcomponent>