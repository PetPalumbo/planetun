component extends="taffy.core.api" {

	this.name = "planetun";
	this.datasource="postgres";

	// Add mappings for taffy
	this.mappings['/taffy'] = expandPath('./taffy');
	this.mappings['/resources'] = expandPath('./resources');
	
	this.datasources["postgres"] = {
		class: 'org.postgresql.Driver'
		, connectionString: 'jdbc:postgresql://postgres:5432/planetundb?useSSL=false&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useLegacyDatetimeCode=true'
		, username: 'postgres'
		, password: "postgres"
	};
	
}

