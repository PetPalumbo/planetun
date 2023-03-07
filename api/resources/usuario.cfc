<cfcomponent extends="taffy.core.resource" taffy:uri="/usuario/ocorrencia/{ocorrenciaID}">

	<cffunction name="get">
		<cfset var local = {} />
		<cfquery name="local.qGetUsuario">
			SELECT id, ocorrencia_id, nome, email, telefone description FROM usuario
			WHERE ocorrencia_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />
		</cfquery>
		<cfreturn representationOf( local.qGetUsuario ) />
	</cffunction>

	<cffunction name="post">
		<cfargument name="ocorrenciaId" required="true"/>
		<cfargument name="nome" type="string" required="true" default="" />
		<cfargument name="email" type="string" required="true" default="" />
		<cfargument name="telefone" type="string" required="true" default="" />
		<cfset var local = {} />

		<cfquery name="local.qPostUsuario">
			INSERT INTO usuario (ocorrencia_id, nome, email, telefone) VALUES (
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.ocorrenciaId#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.nome#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.telefone#" />
			)
		</cfquery>
		<cfreturn noData() />
	</cffunction>

</cfcomponent>