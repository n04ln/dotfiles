" 標準ライブラリできてないのでやる.
" /usr/local/Cellar/go/1.16.5/libexec/src/context/context.go
func! sandbox#make_url_path(sl, el) abort
    let f=expand("%:p")
    " !xをXに変える
    " e.g, !google!cloud!platform => GoogleCloudPlatform
    let f=substitute(f, '!\(.\)', '\U\1', "g")
    let fs=split(f, "@")
    if f =~ "^/usr/local/Cellar/go/.*$"
        " 標準ライブラリ
        let ss=split(f, "/")
        let hash="go" . ss[4] "cs.opensource.google/go/goはversionが何故か`go1.16.2` 的な
        let i=0
        while i < 6
            unlet ss[0]
            let i += 1
        endwhile
        let crepo="cs.opensource.google/go/go"
        return sandbox#url(crepo, hash, join(ss, "/"), a:sl, a:el)
    elseif len(fs) != 2
        " 同じパッケージ
        let GHQPATH=$GHQPATH
        let ff=substitute(f, GHQPATH, "", "g")
        let ffs=split(ff, "/")
        if len(ffs) < 4
            echo "failed. invalid ff: " . ff
            return
        endif
        let host=ffs[0]
        let org=ffs[1]
        let repo=ffs[2]
        let path=[]
        for n in range(3, len(ffs)-1)
            call add(path, ffs[n])
        endfor
        let hash=substitute(system("git rev-parse HEAD"), "\n", "", "g")
        let crepo=join([host, org, repo], "/")
        return sandbox#url(crepo, hash, join(path, "/"), a:sl, a:el)
    else
        " 依存パッケージ
        if f !~ ".*\.go$"
            echo "failed. not go file"
            return
        endif
        let first=fs[0]
        let second=fs[1]
        let seconds=split(second, "/")
        let GOMODCACHE=system("go env GOMODCACHE | tr -d ' \n'")
        if GOMODCACHE == ""
            echo "failed. GOMODCACHE is empty"
            return
        endif
        let GOMODCACHE=GOMODCACHE . "/"
        let r=substitute(first, GOMODCACHE, "", "g")
        let rs=split(r, "/")
        let rscnt=0
        let rrs=[]
        let crepo=""
        while rscnt < len(rs)
            let rrs=add(rrs, rs[rscnt])
            let crepo=system("curl -s https://pkg.go.dev/" . join(rrs, "/") . "| grep -C 3 UnitMeta-repo | tail -n 1 | tr -d ' \n'")
            let rscnt+=1
            if crepo!=""
                break
            endif
        endwhile
        let ts=[]
        while rscnt < len(rs)
            let ts=add(ts, rs[rscnt])
            let rscnt+=1
        endwhile
        let hash=seconds[0]
        unlet seconds[0]
        let seconds=ts+seconds
        let path=join(seconds, "/")
        if hash =~ "^v0\.0\.0.*"
            let vs=split(hash, "-")
            let hash=vs[2]
        endif
        if crepo == ""
            " NOTE: privだったりで空文字の場合は多分独自ドメインを使っていないであろう...
            let crepo=r
        endif
        return sandbox#url(crepo, hash, path, a:sl, a:el)
    endif
endfunc

func! sandbox#make_suffix(sl, el) abort
    let suffix=""
    if a:sl == a:el
        let suffix="#L"  . a:sl
    else
        let suffix="#L"  . a:sl . "-L" . a:el
    endif
    return suffix
endfunc

func! sandbox#make_google_suffix(sl, el) abort
    let suffix=""
    if a:sl == a:el
        let suffix=";l="  . a:sl
    else
        let suffix=";l="  . a:sl . "-" . a:el
    endif
    return suffix
endfunc

func! sandbox#url(crepo, hash, path, sl, el) abort
    " github:               https://github.com/n04ln/ani2ico/blob/master/ani2ico.c#L10-L20
    " gitlab:               https://gitlab.com/n04ln/blob_uploader_infra/-/blob/master/lib/blob_uploader_infra-stack.ts#L12-L13
    " gitea:                https://gitea.com/xorm/xorm/src/branch/master/core/error.go#L5-L12
    " cs.opensource.google: https://cs.opensource.google/go/x/oauth2/+/master:gitlab/gitlab.go;l=10-12
    let url_path=""
    let suffix=""
    if a:crepo =~ "github.com"
        let us=add(["https:/", a:crepo, "blob", a:hash], a:path)
        let url_path=join(us, "/")
        let suffix=sandbox#make_suffix(a:sl, a:el)
    elseif a:crepo =~ "gitlab.com"
        " 未動作確認
        let us=add(["https:/", a:crepo, "-/blob", a:hash], a:path)
        let url_path=join(us, "/")
        let suffix=sandbox#make_suffix(a:sl, a:el)
    elseif a:crepo =~ "gitea.com"
        " 未動作確認
        let us=add(["https:/", a:crepo, "src", a:hash], a:path)
        let url_path=join(us, "/")
        let suffix=sandbox#make_suffix(a:sl, a:el)
    elseif a:crepo =~ "cs.opensource.google"
        " 何故かhashは8文字じゃないといけないぽい。解らぬ
        let hash=strpart(a:hash, 0, 8)
        let us=["https:/", a:crepo, "+", hash]
        let url_path=join(us, "/") . ":" . a:path
        let suffix=sandbox#make_google_suffix(a:sl, a:el)
    else
        echo "failed. invalid crepo: " . a:crepo
        return
    endif
    return url_path . suffix
endfunc

func! sandbox#jump_github_multi() range
    let url_path=sandbox#make_url_path(a:firstline, a:lastline)
    echo url_path
    call system("echo '" . url_path . "' | pbcopy")
endfunc

func! sandbox#jump_github_single() abort
    let url_path=sandbox#make_url_path()
    let l=line(".")
    let url_path_with_line=url_path . "#L"  . l
    echo url_path_with_line
    " call system("open " . url_path_with_line)
    call system("echo " . url_path_with_line . " | pbcopy")
endfunc

vnoremap <silent><C-i> :call sandbox#jump_github_multi()<CR>
nnoremap <silent><C-i> :call sandbox#jump_github_multi()<CR>

" func! sandbox#f() abort
" " /Users/noah/ghq/pkg/mod/github.com/gnexltd/protobuf-client-go@v0.97.0/threeapi/v1/threeapiv1.pb.go
" " /Users/noah/ghq/pkg/mod/github.com/kevinburke/rest@v0.0.0-20210222204520-f7a2e216372f/resterror/resterror.go
"     let f=expand("%:p")
"     let fs=split(f, "@")
"     if len(fs) != 2
"         echo "not go module file"
"         return
"     endif
" endfunc
