# From the CentOS fasttrack Readme.txt file
# There is a channel provided by the upstream provider called FasTrack.
#
# This channel will have RPMS that are going to be included in the normal
# update sets (3-4 times per year), but released once a week.  These RPMS
# will normally be bugfix or enhancement updates and not Security updates.
#
# Accordingly, CentOS has created a fasttrack (note the spelling difference,
# it is intentional) repo.  This repo will track the upstream FasTrack channel.
#
# If you would like to use the FastTrack repo for CentOS-6, copy the file
# CentOS-fasttrack.repo into your /etc/yum.repos.d/ directory and it will
# be enabled.
#
# See this upstream mailing list post for more info on fastrack:
#
# https://www.redhat.com/archives/nahant-list/2006-April/msg00001.html
#
# Also see the upstream info here:
#
# http://www.redhat.com/rhn/rhndetails/fastrack/
class repo_centos::fasttrack inherits repo_centos {

  if $repo_centos::enable_fasttrack {
    $enabled = 1
  } else {
    $enabled = 0
  }
  
  #mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=fasttrack&infra=$infra
  #baseurl=http://mirror.centos.org/centos/$releasever/fasttrack/$basearch/

  yumrepo { 'centos-fasttrack':
    baseurl  => "${repourl}/${urlbit}/fasttrack/${::architecture}",
    descr    => "${operatingsystem} ${::os_maj_version}  - ${::architecture}",
    enabled  => "${enabled}",
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-${::os_maj_version}",
    #priority => '2',
  }

}
