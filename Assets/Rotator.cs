using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotator : MonoBehaviour
{

    //public Transform myTransform;
    // Start is called before the first frame update
    void Start()
    {    
    
    }

    // Update �� �� 1�ʿ� 60��
    void Update()
    {
        transform.Rotate(60*Time.deltaTime, 60*Time.deltaTime, 60*Time.deltaTime); // �ʹ� ���� -> ������Ʈ �ѹ��� 60�� ȸ��
        // Time.deltaTime -> ex �ʴ� 60������ => 1/60
    }
    
    // 1m * 30 = 30 * (1/30) = 1m

    // 1m�� �����̴� Ƚ���� �ɰ� �� -> Time.deltaTime

}
