<div class="scrollspy">
    <ul id="main-menu" data-spy="affix" class="nav">
        <li>
            <a href="#doc-general-notes">General notes</a>
        </li>
        {{ with $structures := .Structures }}
        <li>
            <a href="#doc-api-structures">API structures</a>
            <ul>
                {{ range $structures }}
                <li>
                    <a href="#struct-{{ .Name }}">{{ .Name }}</a>
                </li>
                {{ end }}
            </ul>
        </li>
        {{ end }}
        {{ range .Requests }}
        <li>
            <a href="#request-{{ slugify .Name }}">{{ .Name }}</a>
        </li>
        {{ end }}
        {{ range .Folders }}
        {{ $folder := . }}
        <li>
            <a href="#folder-{{ slugify $folder.Name }}">{{ $folder.Name }}</a>
            <ul>
                {{ range $folder.Requests }}
                <li>
                    <a href="#request-{{ slugify $folder.Name }}-{{ slugify .Name }}">{{ .Name }}</a>
                </li>
                {{ end }}
                <!-- Subfolder handling -->
                {{ range $folder.Folders }}
                {{ $subfolder := . }}
                <li>
                    <a href="#folder-{{ slugify $subfolder.Name }}">{{ $subfolder.Name }}</a>
                    <ul>
                        {{ range $subfolder.Requests }}
                        <li>
                            <a href="#request-{{ slugify $subfolder.Name }}-{{ slugify .Name }}">{{ .Name }}</a>
                        </li>
                        {{ end }}
                    </ul>
                </li>
                {{ end }}
                <!-- End of Subfolder handling -->
            </ul>
        </li>
        {{ end }}
    </ul>
</div>
