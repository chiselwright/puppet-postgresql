import "classes/*.pp"
import "definitions/*.pp"
  
class postgresql {
  case $operatingsystem {
    Debian: { 
      case $lsbdistcodename {
        etch :   { include postgresql::debian::v8-3 }
        julia:   { include postgresql::debian::v8-4 }
        lenny :  { include postgresql::debian::v8-3 }
        squeeze: { include postgresql::debian::v8-4 }
        default: { fail "postgresql not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    } 
    Ubuntu: {
      case $lsbdistcodename {
        lucid :  { include postgresql::ubuntu::v8-4 }
        default: { fail "postgresql not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}

class postgresql::v8-3 {
  case $operatingsystem {
    Debian: {
      case $lsbdistcodename {
        etch :   { include postgresql::debian::v8-3 }
        lenny :  { include postgresql::debian::v8-3 }
        default: { fail "postgresql 8.3 not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}

class postgresql::v8-4 {
  case $operatingsystem {
    Debian: {
      case $lsbdistcodename {
        lenny :  { include postgresql::debian::v8-4 }
        squeeze: { include postgresql::debian::v8-4 }
        default: { fail "postgresql 8.4 not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    }
    Ubuntu: {
      case $lsbdistcodename {
        lucid :  { include postgresql::ubuntu::v8-4 }
        default: { fail "postgresql 8.4 not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}
