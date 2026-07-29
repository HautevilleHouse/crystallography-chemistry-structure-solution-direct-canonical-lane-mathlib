import CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

structure AdmissibleClass where
  object : CrystallographyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CrystallographyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse