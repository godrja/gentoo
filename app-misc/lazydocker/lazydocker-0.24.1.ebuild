EAPI=8

inherit go-module

DESCRIPTION="The lazier way to manage everything docker"
HOMEPAGE="https://github.com/jesseduffield/lazydocker"
SRC_URI="https://github.com/jesseduffield/lazydocker/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-containers/docker"

DOCS=( {CODE-OF-CONDUCT,CONTRIBUTING,README}.md docs )

src_compile() {
    ego build -o bin/lazydocker \
        -ldflags "-X main.version=${PV}"
}

src_test() {
    ego test ./... -short
}

src_install() {
    dobin bin/lazydocker
    einstalldocs
}

