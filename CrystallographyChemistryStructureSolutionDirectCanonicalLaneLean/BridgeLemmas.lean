import CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CrystallographyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse