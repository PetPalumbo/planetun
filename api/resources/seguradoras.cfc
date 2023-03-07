<cfcomponent extends="taffy.core.resource" taffy:uri="/seguradoras">

	<cffunction name="get">
		<cfset var local = {} />
		<cfquery name="local.qGetSeguradoras">
			SELECT id, nome, token description FROM seguradora ORDER BY id
		</cfquery>
		<cfreturn representationOf( local.qGetSeguradoras ) />
	</cffunction>

</cfcomponent>