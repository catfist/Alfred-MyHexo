Alfred-MyHexo
=============

Alfred Workflow for manage Hexo project

![screenshot](http://cl.ly/Y9bo/Image%202014-10-22%20at%2012.27.59%20%E5%8D%88%E5%89%8D.png)

# Workflow to manage your Hexo blog

This workflow has attracted a command for managing your Hexo blog.

## Setup
Input your info to some variable and Search Scope.

### 'hexo' Script Filter
* dir: Path of your hexo project folder

### '/bin/bash' Script (Next to 'hs' Script Filter)
* dir: Path of your hexo project folder
* editor: Name of your favorite editor
* url: URL of your site

### 'h:s' & 'h:f' File Filter
Add your 'source' folder to Search Scope.

## Usage
| Input      | Action                               | Amendment           |
| ---------- | ------------------------------------ | ------------------- |
| hexo       | Open Hexo projext folder in terminal |                     |
| hexod      | Deploy  Hexo                         | with generate       |
| hexos      | Run local server                     |                     |
| hexoc      | Delete all generated files           |                     |
| hexog      | Generate contents                    |                     |
| hs n (arg) | Create new post                      | arg to title        |
| hs d (arg) | Create new draft                     | arg to title        |
| hs p       | Publish drafts                       | only 'status: p'    |
| hs d       | Unpublish posts                      | only 'status: d'    |
| hs o       | Open website                         |                     |
| hs conf    | Open '_config.yml'                   | with default editor |

## Hexo custom arguments
### pid
It is generated by md5 hash function from the title. You can be included in the permalink.

### status
It can be used to manage the public state.