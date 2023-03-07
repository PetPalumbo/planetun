<cfcomponent extends="taffy.core.resource" taffy:uri="/ocorrencias">

	<cffunction name="get">
		<cfset var local = {} />
		<cfquery name="local.qGetOcorrencias">
			SELECT id, descricao description FROM ocorrencia ORDER BY id DESC
		</cfquery>
		<cfreturn representationOf( local.qGetOcorrencias ) />
	</cffunction>

	<cffunction name="post">
		<cfargument name="descricao" type="string" required="true" default="" />
		<cfargument name="dano" type="string" required="true" default="" />
		<cfset data = CREATEODBCDATETIME( Now() ) />
		<cfset var local = {} />

		<cfquery name="local.qPostProduct">
			INSERT INTO ocorrencia (descricao, dano, created_at) VALUES (
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.descricao#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.dano#" />,
				<cfqueryparam cfsqltype="cf_sql_date" value="#data#" />
			)
		</cfquery>
		<cfreturn noData() />
	</cffunction>

</cfcomponent>