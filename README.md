Alfred-MyHexo
=============

Alfred Workflow for manage Hexo project.

![screenshot](http://cl.ly/YGYn/Image%202014-10-29%20at%209.42.47%20%E5%8D%88%E5%BE%8C.png)

# Workflow to manage your Hexo blog

This workflow has attracted a command for managing your Hexo blog.

## Setup
Input your info to some variables and 'source' folder.

### '/bin/bash' Script action (Next to 'hx' Script Filter)
* dir: Path of your hexo project folder
* editor: Name of your favorite editor
* terminal: Name of your favorite Terminal emulator
* url: URL of your site

### 'h:s' & 'h:f' File Filter
Add your 'source' folder to Search Scope.

### Two '/bin/bash' Script action (Next to 'h:s' & 'h:f' File Filter)
Change each variables to suit your '_config.yml'.

## Usage
| Alfred text     | Commands                                               | Options (&lt;\*&gt;:Required / [\*],-\*,--\*:Optional) |
| --------------- | ------------------------------------------------------ | ------------------------------------------------------ |
| hx              | Open Hexo project folder in Terminal                   |                                                        |
| hxn             | Create new article                                     | &lt;title&gt;                                          |
| hxb             | Create draft (blueprint)                               | &lt;title&gt;                                          |
| hxp             | Publish drafts  ('status: p' in 'drafts' folder)       |                                                        |
| hxu             | Unpublish article  ('status: d' in 'posts' folder)     |                                                        |
| hxo             | Open website in default brower                         |                                                        |
| hxconf          | Open '_config,yml'  (with default editor)              |                                                        |
| hxh             | Reference to Help                                      |                                                        |
| hxg(generate)   | Generate contents                                      | -d, --deploy, -w, --watch                              |
| hxd(deploy)     | Deploy contents                                        | --setup, -g, --generate, -m, --message                 |
| hxs(server)     | Run & open local server (at http://localhost:4000/)    | -p, --port, -s, --static, -l, --log, -d, --drafts      |
| hxr(render)     | Renders files                                          | &lt;file1&gt; [file2] -o, --output                     |
| hxm(migrate)    | Migrates content from other blog systems               | &lt;type&gt;                                           |
| hxc(clean)      | Delete all generated files                             |                                                        |
| hxtag           | Search & Copy Tag or Categories from existing articles | &lt;word&gt;                                           |
| h:f             | Find folder with file names                            | (ctrl):Copy Markdown link (Shift): Open URL            |
| h:s             | Search folder with file contents                       | (ctrl):Copy Markdown link (Shift): Open URL            |
| hxdg,hxgd       | Generate & Deploy contents & Open Site                 |                                                        |

## Hexo custom arguments
### pid
It is generated by md5 hash function from the title. You can be included in the permalink.

### status
It can be used to manage the public state.
