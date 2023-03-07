<cfcomponent extends="taffy.core.resource" taffy:uri="/avaliacao/ocorrencia/{ocorrenciaID}">

	<cffunction name="get">
		<cfset var local = {} />
		<cfquery name="local.qGetAvaliacao">
			SELECT id, ocorrencia_id, cliente_atual, bem_atendido, sugestao, nota_geral FROM avaliacao
			WHERE ocorrencia_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn representationOf( local.qGetAvaliacao ) />
	</cffunction>

	<cffunction name="post">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfargument name="cliente_atual" type="string" required="true" default="" />
		<cfargument name="bem_atendido" type="string" required="true" default="" />
		<cfargument name="sugestao" type="string" required="true" default="" />
		<cfargument name="nota_geral" type="numeric" required="true" default="" />
		<cfset var local = {} />

		<cfquery name="local.qPostGeolocation">
			INSERT INTO usuario (ocorrencia_id, ip_address, pais, cidade) VALUES (
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cliente_atual#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bem_atendido#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.sugestao#" />,
				<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.nota_geral#" />
			)
		</cfquery>
		<cfreturn noData() />
	</cffunction>

</cfcomponent>