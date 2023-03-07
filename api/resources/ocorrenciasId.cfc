<cfcomponent extends="taffy.core.resource" taffy:uri="/ocorrencias/{ocorrenciaId}">

	<cffunction name="get">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfset var local = {} />
		<cfquery name="local.qGetOcorrencia">
			SELECT id, descricao, dano FROM ocorrencia
			WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn representationOf( local.qGetOcorrencia ) />
	</cffunction>

	<cffunction name="put">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfargument name="descricao" type="string" required="false" default="" />
		<cfargument name="dano" type="string" required="false" default="" />
		<cfset var local = {} />
		<cfquery name="local.qPutOcorrencia">
			UPDATE ocorrencia
			SET	descricao = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.name#">,
				dano = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.dano#">
			WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn noData() />
	</cffunction>

	<cffunction name="delete">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfset var local = {} />
		<cfquery name="local.qDeleteOcorrencia">
			delete from ocorrencia
			where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn noData() />
	</cffunction>

</cfcomponent>