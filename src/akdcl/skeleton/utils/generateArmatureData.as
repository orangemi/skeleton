package akdcl.skeleton.utils {
	import akdcl.skeleton.objects.ArmatureData;
	import akdcl.skeleton.objects.BoneData;
	
	/**
	 * ...
	 * @author Akdcl
	 */
	public function generateArmatureData(_armatureXML:XML):ArmatureData {
		var _armatureData:ArmatureData = new ArmatureData(String(_armatureXML.attribute(ConstValues.A_NAME)));
		var _boneData:BoneData;
		
		for each(var _boneXML:XML in _armatureXML.elements(ConstValues.BONE)) {
			_boneData = new BoneData(
				Number(_boneXML.attribute(ConstValues.A_X)),
				Number(_boneXML.attribute(ConstValues.A_Y)),
				Number(_boneXML.attribute(ConstValues.A_SKEW_X)) * ConstValues.ANGLE_TO_RADIAN,
				Number(_boneXML.attribute(ConstValues.A_SKEW_Y)) * ConstValues.ANGLE_TO_RADIAN
			);
			_boneData.z = int(_boneXML.attribute(ConstValues.A_Z));
			_boneData.name = String(_boneXML.attribute(ConstValues.A_NAME));
			_boneData.parent = String(_boneXML.attribute(ConstValues.A_PARENT));
			
			for each(var _displayXML:XML in _boneXML.elements(ConstValues.DISPLAY)){
				_boneData.setDisplayAt(_displayXML.attribute(ConstValues.A_NAME), Boolean(int(_displayXML.attribute(ConstValues.A_IS_ARMATURE))), _displayXML.childIndex());
			}
			
			_armatureData.addData(_boneData);
		}
		return _armatureData;
	}
	
}