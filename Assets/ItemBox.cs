using System.Collections;
using System.Collections.Generic;
using System.Transactions;
using UnityEngine;

public class ItemBox : MonoBehaviour
{
    private Renderer myRenderer;
    public Color touchColor;
    private Color originalColor;
    // Start is called before the first frame update
    void Start()
    {

        myRenderer = GetComponent<Renderer>();

    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other) // ����Ƽ�� �ڵ����� �߻������ִ� �Լ�
    {   // Trigger�� �ݶ��̴��� �浹�� ȣ��
        
        if(other.tag == "EndPoint")
        {
            Debug.Log("�浹����! endPoint");
            myRenderer.material.color = Color.red;

        }
    }

    // �Ϲ� �ݶ��̴��� �浹������ �ڵ����� ����
    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log("�浹");
    }
}
