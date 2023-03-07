<cfcomponent extends="taffy.core.resource" taffy:uri="/geolocation/ocorrencia/{ocorrenciaID}">

	<cffunction name="get">
		<cfset var local = {} />
		<cfquery name="local.qGetGeolocation">
			SELECT id, ocorrencia_id, ip_address, pais, cidade FROM geolocation
			WHERE ocorrencia_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn representationOf( local.qGetGeolocation ) />
	</cffunction>

	<cffunction name="post">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfargument name="ip_address" type="string" required="true" default="" />
		<cfargument name="pais" type="string" required="true" default="" />
		<cfargument name="cidade" type="string" required="true" default="" />
		<cfset var local = {} />

		<cfquery name="local.qPostGeolocation">
			INSERT INTO geolocation (ocorrencia_id, ip_address, pais, cidade) VALUES (
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.ip_address#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pais#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cidade#" />
			)
		</cfquery>
		<cfreturn noData() />
	</cffunction>

</cfcomponent>