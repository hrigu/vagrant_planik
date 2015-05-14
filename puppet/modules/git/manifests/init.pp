# Install git
# Kopiert vom github repo 'vagrantpress'
class git::install {

  package{'git':
    ensure=>present,
  }

}
