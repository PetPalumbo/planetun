<cfcomponent extends="taffy.core.resource" taffy:uri="/veiculo/ocorrencia/{ocorrenciaId}">

	<cffunction name="get">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfset var local = {} />
		<cfquery name="local.qGetVeiculo">
			SELECT id, ocorrencia_id, fabricante, modelo, cor, placa FROM veiculo
			WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn representationOf( local.qGetVeiculo ) />
	</cffunction>

	<cffunction name="post">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfargument name="faricante" type="string" required="false" default="" />
		<cfargument name="modelo" type="string" required="false" default="" />
		<cfargument name="cor" type="string" required="false" default="" />
		<cfargument name="placa" type="string" required="true" default="" />
		<cfset var local = {} />

		<cfquery name="local.qPostVeiculo">
			INSERT INTO veiculo (ocorrencia_id, fabricante, modelo, cor, placa) VALUES (
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fabricante#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.modelo#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cor#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.placa#" />
			)
		</cfquery>
		<cfreturn noData() />
	</cffunction>

</cfcomponent>